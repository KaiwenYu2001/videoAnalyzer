from django.shortcuts import render
from django.http import HttpResponse


# Create your views here.
def index(request):
    return render(request, "app/index.html")


def web_streams(request):
    return render(request, "app/web_streams.html")


def web_player(request):
    return render(request, "app/web_player.html")

def myplayer(request):
    return render(request, "app/myplayer.html")
