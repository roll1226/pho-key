import firebase_admin
import datetime
from firebase_admin import credentials, firestore, storage
from flask import escape
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

  if request_json and 'challenge_id' in request_json:
      challenge_id = str(request_json['challenge_id'])
  else:
      return {
        'code': 500
      }

  if request_json and 'key_path' in request_json:
      key_path = str(request_json['key_path'])
  else:
      return {
        'code': 500
      }

  try:
    challenge_doc = db.collection('challenge').document(str(challenge_id)).get()

    if challenge_doc.exists:
      keyhole_doc = db.collection('keyholes').document(str(challenge_doc.to_dict()['keyhole_id'])).get()

      if keyhole_doc.exists:
        keyhole_hash = imagehash.average_hash(Image.open(requests.get(keyhole_doc.to_dict().imagePath, stream=True).raw))
        key_hash = imagehash.average_hash(Image.open(requests.get(key_path, stream=True).raw))

        similarity = keyhole_hash - key_hash

        if similarity > 10: # 画像が一致していない場合
          return {
            'code': 403,
            'isSimilarity': False
          }
        else: # 画像が一致している場合
          return {
            'code': 200,
            'isSimilarity': True
          }

      else: # keyholeがない場合
        return {
          'code': 500,
          'isSimilarity': False
        }

    else: # challengeがない場合
      return {
        'code': 500,
        'isSimilarity': False
      }

  except: # 失敗した場合
    return {
      'code': 500,
      'isSimilarity': False
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
      'keyhole_id': keyhole_id,
      'delFlag': False,
      'createdAt': now,
      'updatedAt': now,
    })

    return challenge_code

  except:
    return ''
