import email
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators import csrf
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse
import json
from django.db import connection


# Create your views here.

@csrf_exempt
def index(request):
    obj = {
        'response':'ok'
    }
    return JsonResponse(obj, safe=False)

@csrf_exempt
def home(request):
    return HttpResponse("Hack-Droid")


@csrf_exempt
def get_items(request):
    if(request.method=='GET'):
        cursor  = connection.cursor()
        cursor.execute("select * from public.sport_item")
        r=cursor.fetchall()
        return JsonResponse(r,safe=False)  

@csrf_exempt
def remove_item(request,id):
    if(request.method=='GET'):
        cursor  = connection.cursor()
        cursor.execute("select * from public.sport_item where id = %s ", [id])
        r=cursor.fetchall()
        item_count=r[0][2]
        item_count=item_count-1
        cursor.execute("update public.sport_item set quantity = %s where id = %s",[item_count,id])
        obj = {
            'response': 'removal completed'
        }
        return JsonResponse(obj,safe=False)


@csrf_exempt
def add_item(request, id):
    if(request.method == 'GET'):
        cursor = connection.cursor()
        cursor.execute("select * from public.sport_item where id = %s ", [id])
        r = cursor.fetchall()
        item_count = r[0][2]
        item_count = item_count+1
        cursor.execute("update public.sport_item set quantity = %s where id = %s", [
                       item_count, id])
        obj = {
            'response': 'addition completed'
        }
        return JsonResponse(obj, safe=False)

@csrf_exempt
def add_log(request):
    if(request.method == 'POST'):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        email = body['email']
        item = body['item']
        date = body['date']
        issue_time = body['issue_time']
        return_time = body['return_time']
        cursor = connection.cursor()
        cursor.execute("insert into public.log_book (email,item,date,issue_time,return_time) values (%s,%s,%s,%s,%s)", [email,item,date,issue_time,return_time])
        obj = {
            "message": "Logbook Updated Successfully",
            "status": "True"
            }
        return JsonResponse(obj, safe=False)
    return HttpResponse("Adding Failed!")

@csrf_exempt
def check_user(request):
    if(request.method == 'POST'):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        email = body['email']
        password = body['password']
        cursor = connection.cursor()
        cursor.execute("select password from public.users where email = %s ", [email])
        r= cursor.fetchall()
        if(password==r):
            return HttpResponse("1")
        else:
            return HttpResponse("2")

# @csrf_exempt
# def complaint_status(request,complain_id):
#     if(request.method=='GET'):
#         cursor  = connection.cursor()
#         cursor.execute("select * from grievance where userid = %s ", [complain_id])
#         r=cursor.fetchall()
#         return JsonResponse(r[0],safe=False)\


# @csrf_exempt
# def add_resource(request):
#     if(request.method == 'POST'):
#         body_unicode = request.body.decode('utf-8')
#         body = json.loads(body_unicode)
#         resource_name = body['resource_name']
#         college = body['college']
#         rating = body['rating']
#         domain_code = body['domain_code']
#         price = body['price']
#         unique_id = body['unique_id']
#         department = body['department']
#         cursor = connection.cursor()
#         cursor.execute(
#             "insert into resources (resource_name,college,rating,domain_code,price,unique_id,department) values (%s,%s,%s,%s,%s,%s,%s)", [resource_name, college, rating, domain_code, price, unique_id, department])
#         obj = {
#             "message": "Resource Added Successfully",
#             "status": "True"
#         }
#         return JsonResponse(obj, safe=False)
#     return HttpResponse("Adding Failed!")
