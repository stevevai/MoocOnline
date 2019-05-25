from django.shortcuts import render
from django.views.generic.base import View

from .models import Article
# Create your views here.


class ArticleListView(View):
    def get(self, request):
        all_articles = Article.objects.all()
        return render(request, 'article_list.html', {"all_articles": all_articles})


class ArticleDetail(View):
    def get(self, request, article_id):
        # 取出相应的文章
        article = Article.objects.get(id=article_id)
        # 需要传递给模板的对象
        context = {'article': article}
        # 载入模板，并返回context对象
        return render(request, 'article_detail.html', context)