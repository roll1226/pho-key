# import json
# import firebase_admin
# import datetime
# from firebase_admin import credentials
# from firebase_admin import firestore


# # ===================== Firebase =====================================
# # このPythonファイルと同じ階層に認証ファイルを配置して、ファイル名を格納
# JSON_PATH = './pho-key-firebase-adminsdk-s4046-d8fa9706d9.json'

# # Firebase初期化
# cred = credentials.Certificate(JSON_PATH)
# firebase_admin.initialize_app(cred)
# db = firestore.client()
# now =  now = datetime.datetime.now(datetime.timezone(datetime.timedelta(hours=9)))

# doc_ref = db.collection('news')
# doc_ref.add({
#     'title': 'タイトル',
#     'body':  'body',
#     'createdAt': now,
# })
# print('done')
from flask import escape
import functions_framework

@functions_framework.http
def compare_image(request):
  return 'compare_image'

@functions_framework.http
def create_keyhole(request):
  return 'create_keyhole'

@functions_framework.http
def create_challenge(request):
  return 'create_challenge'
