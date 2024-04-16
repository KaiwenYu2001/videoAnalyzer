from django.urls import path

from . import views

app_name='app'
urlpatterns = [
    # path("", views.index, name="index"),
    path("streams", views.web_streams, name="web_streams"),
    path("player", views.web_player, name="web_player"),
    path('', views.web_index, name="index"),
    path('api/getStreams', views.api_getStreams),
    path('api/getIndex', views.api_getIndex),
]