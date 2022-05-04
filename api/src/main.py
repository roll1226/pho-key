import math
import firebase_admin
import datetime
from firebase_admin import credentials, firestore, storage
import functions_framework
from PIL import Image
import imagehash
import requests
from utils.randam_util import createChallengeCode

JSON_PATH = './pho-key-firebase-adminsdk-s4046-d8fa9706d9.json'

cred = credentials.Certificate(JSON_PATH)
firebase_admin.initialize_app(cred, {"storageBucket": "pho-key.appspot.com"})
db = firestore.client()
bucket = storage.bucket()
now = datetime.datetime.now(datetime.timezone(datetime.timedelta(hours=9)))

@functions_framework.http
def compare_image(request):
  request_json = request.get_json(silent=True)
  pole_radius = 6356752.314245
  equator_radius = 6378137.0

  if request_json and 'challenge_id' in request_json:
      challenge_id = str(request_json['challenge_id'])
  else:
      return 0

  if request_json and 'key_path' in request_json:
      key_path = str(request_json['key_path'])
  else:
      return 0

  if request_json and 'latitude' in request_json:
      latitude = float(request_json['latitude'])
  else:
      return 0

  if request_json and 'longitude' in request_json:
      longitude = float(request_json['longitude'])
  else:
      return 0

  try:
    challenge_doc = db.collection('challenge').document(challenge_id).get()

    if challenge_doc.exists:
      keyhole_doc = db.collection('keyholes').document(str(challenge_doc.to_dict()['keyholeId'])).get()

      if keyhole_doc.exists:
        keyhole_hash = imagehash.average_hash(Image.open(requests.get(keyhole_doc.to_dict()['imagePath'], stream=True).raw))
        key_hash = imagehash.average_hash(Image.open(requests.get(key_path, stream=True).raw))

        similarity = keyhole_hash - key_hash
        print(similarity)

        if similarity > 10: # 画像が一致していない場合
          return '0'
        else: # 画像が一致している場合
          latlon_keyhole = (float(keyhole_doc.to_dict()['latitude']), float(keyhole_doc.to_dict()['longitude']))
          latlon_key = (latitude, longitude)
          lat_keyhole = math.radians(latlon_keyhole[0])
          lon_keyhole = math.radians(latlon_keyhole[1])
          lat_key = math.radians(latlon_key[0])
          lon_key = math.radians(latlon_key[1])
          lat_difference = lat_keyhole - lat_key       # 緯度差
          lon_difference = lon_keyhole - lon_key       # 経度差
          lat_average = (lat_keyhole + lat_key) / 2    # 平均緯度
          e2 = (math.pow(equator_radius, 2) - math.pow(pole_radius, 2)) \
                  / math.pow(equator_radius, 2)  # 第一離心率^2
          w = math.sqrt(1- e2 * math.pow(math.sin(lat_average), 2))
          m = equator_radius * (1 - e2) / math.pow(w, 3) # 子午線曲率半径
          n = equator_radius / w                         # 卯酉線曲半径
          distance = math.sqrt(math.pow(m * lat_difference, 2) \
                        + math.pow(n * lon_difference * math.cos(lat_average), 2)) # 距離計測
          print(distance / 1000)
          return '0' if (distance / 1000) > 2 else '1'

      else: # keyholeがない場合
        return 0

    else: # challengeがない場合
      return 0

  except: # 失敗した場合
    return {
      'text': '失敗'
    }



@functions_framework.http
def create_keyhole(request):
  request_json = request.get_json(silent=True)
  keyholes_ref = db.collection('keyholes')

  if request_json and 'image_path' in request_json:
      image_path = str(request_json['image_path'])
  else:
      return ''

  if request_json and 'body' in request_json:
      body = str(request_json['body'])
  else:
      return ''

  if request_json and 'latitude' in request_json:
      latitude = str(request_json['latitude'])
  else:
      return ''

  if request_json and 'longitude' in request_json:
      longitude = str(request_json['longitude'])
  else:
      return ''

  # if request_json and 'creator_id' in request_json:
  #     creator_id = str(request_json['creator_id'])
  # else:
  #     return {
  #       'code': 500,
  #       'keyhole': {}
  #     }
  try:
    keyholes_code = createChallengeCode(20)
    print(keyholes_code, image_path)
    keyholes_ref.document(keyholes_code).set({
      'body': body,
      'imagePath': image_path,
      'delFlag': False,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': now,
      'updatedAt': now,
    })
    return keyholes_code
  except:
    return ''

@functions_framework.http
def create_challenge(request):
  request_json = request.get_json(silent=True)

  if request_json and 'keyhole_id' in request_json:
      keyhole_id = str(request_json['keyhole_id'])
  else:
      return ''

  try:
    challenge_code = createChallengeCode(20)
    challenge_ref = db.collection('challenge')

    challenge_ref.document(challenge_code).set({
      'code': challenge_code,
      'keyholeId': keyhole_id,
      'delFlag': False,
      'createdAt': now,
      'updatedAt': now,
    })

    return challenge_code

  except:
    return ''
