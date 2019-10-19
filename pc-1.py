import requests
from bs4 import BeautifulSoup
import bs4
def gethtmltext(url):
    r = requests.get(url)
    r.encoding = r.apparent_encoding
    return r.text

#获取网页信息
def fillunivlist(ulist,html):
    soup = BeautifulSoup(html,'html.parser')
    for tr in soup.find('tbody').children:
        if isinstance(tr,bs4.element.Tag):
            tds = tr('td')
            ulist.append([tds[0].string,tds[1].string,tds[3].string])


#将网页信息转化为文本
def printunivlist(ulist,num):
    print('{:^10}\t{:^4}\t{:^14}'.format('排名','学校名称','总分'))
    for i in range(num):
        u = ulist[i]
        print('{:^10}\t{:^10}\t{:^14}'.format(u[0],u[1],u[2]))
#将文本信息打印
def main():
    uinfo = []
    r = gethtmltext('http://www.zuihaodaxue.com/zuihaodaxuepaiming2019.html')
    fillunivlist(uinfo,r)
    printunivlist(uinfo,50)
main()

