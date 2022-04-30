import json
from pydoc import doc
import firebase_admin
import datetime
from firebase_admin import credentials
from firebase_admin import firestore
from flask import escape
import functions_framework
from utils.randam_util import createChallengeCode

JSON_PATH = './pho-key-firebase-adminsdk-s4046-d8fa9706d9.json'

cred = credentials.Certificate(JSON_PATH)
firebase_admin.initialize_app(cred)
db = firestore.client()
now = datetime.datetime.now(datetime.timezone(datetime.timedelta(hours=9)))

# doc_ref = db.collection('news')
# doc_ref.add({
#     'title': 'タイトル',
#     'body':  'body',
#     'createdAt': now,
# })
# print('done')

@functions_framework.http
def compare_image(request):
  return 'compare_image'

@functions_framework.http
def create_keyhole(request):
  return 'create_keyhole'

@functions_framework.http
def create_challenge(request):
  request_json = request.get_json(silent=True)

  try:
    if request_json and 'keyholed_id' in request_json:
        keyholed_id = int(request_json['keyholed_id'])

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
    else:
        return {
          'code': 500,
          'challenge_code': '',
        }

  except:
    return {
      'code': 500,
      'challenge_code': '',
    }
