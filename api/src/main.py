import firebase_admin
import datetime
from firebase_admin import credentials, firestore, storage
from flask import escape
import functions_framework
from utils.randam_util import createChallengeCode

JSON_PATH = './pho-key-firebase-adminsdk-s4046-d8fa9706d9.json'

cred = credentials.Certificate(JSON_PATH)
firebase_admin.initialize_app(cred, {"storageBucket": "pho-key.appspot.com"})
db = firestore.client()
bucket = storage.bucket()
now = datetime.datetime.now(datetime.timezone(datetime.timedelta(hours=9)))

@functions_framework.http
def compare_image(request):
  return 'compare_image'

@functions_framework.http
def create_keyhole(request):
  request_json = request.get_json(silent=True)
  keyholes_ref = db.collection('keyholes')

  if request_json and 'image_path' in request_json:
      image_path = int(request_json['image_path'])
  else:
      return {
        'code': 500,
        'challenge_code': '',
      }

  if request_json and 'body' in request_json:
      body = int(request_json['body'])
  else:
      return {
        'code': 500,
        'challenge_code': '',
      }

  if request_json and 'creator_id' in request_json:
      creator_id = int(request_json['creator_id'])
  else:
      return {
        'code': 500,
        'challenge_code': '',
      }

  try:
    keyholes_ref.add({
      'body': body,
      'imagePath': image_path,
      'creatorId': 2,
      'delFlag': False,
      'createdAt': now,
      'updatedAt': now,
    })
    return {
      'code': 201,
    }
  except:
    return {
      'code': 500,
    }

@functions_framework.http
def create_challenge(request):
  request_json = request.get_json(silent=True)
  if request_json and 'keyholed_id' in request_json:
      keyholed_id = int(request_json['keyholed_id'])

  else:
      return {
        'code': 500,
        'challenge_code': '',
      }

  try:
    challenge_code = createChallengeCode(20)
    challenge_ref = db.collection('challenge')

    challenge_ref.add({
      'code': challenge_code,
      'keyholeId': keyholed_id,
      'delFlag': False,
      'createdAt': now,
      'updatedAt': now,
    })

    return {
      'code': 201,
      'challenge_code': challenge_code,
    }

  except:
    return {
      'code': 500,
      'challenge_code': '',
    }
