# -*- coding: utf-8 -*-
"""
File    : page_parser.py
Date    : 
Author  : 
Desc    :
"""
from bs4 import BeautifulSoup
from bs4 import element


def filter_dom(tag):
    # print '#####'*3 , tag.name
    if tag.name in ['script', 'link', 'meta']:
        return False
    if tag.has_attr('style'):
        style = tag.attrs['style']
        style = style.strip().replace(' ', '')
        # display:none;
        if 'display:none;' not in style:
            return True
        else:
            return False
    if tag.has_attr('type'):
        tp = tag.attrs['type']
        if 'hidden' == tp:
            return False
    if tag.has_attr('hidden'):
        if 'hidden' == tag.attrs['hidden']:
            return False
    return True


def parser_dom(item, result):
    if isinstance(item, element.NavigableString):
        text = item.string.strip()
        if not text:
            return
        result.append(text)
        return
    else:
        if not filter_dom(item):
            return
        for child in item.children:
            # print type(item), item.name, item.prettify().encode('utf-8')
            parser_dom(child, result)


def parser(html):
    soup = BeautifulSoup(html, 'html.parser')
    html_title = soup.title.get_text()
    html_head = soup.head
    html_head_size = len(html_head.__repr__())
    html_body = soup.body
    a_list = html_body.find_all('a')
    a_count = len(a_list)
    html_body_size = len(html_body.__repr__())
    text_list = []
    parser_dom(soup.body, text_list)
    text_list = list(set(text_list))
    text_list = [text.strip('\n').strip() for text in text_list]

    return {
        'title': html_title,
        'head_size': html_head_size,
        'body_size': html_body_size,
        'count_a': a_count,
        'text': text_list
    }
