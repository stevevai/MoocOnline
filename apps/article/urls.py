from django.urls import path

from .views import ArticleListView, ArticleDetail

app_name = 'article'

urlpatterns = [
    path('list', ArticleListView.as_view(), name="article_list"),
    path('detail/<int:article_id>/', ArticleDetail.as_view(), name='article_detail'),
]