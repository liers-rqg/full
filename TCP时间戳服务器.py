from socket import *
from time import ctime
#创建一个TCP时间戳服务器
HOST = ''
PORT = 21567
BUFSIZ = 1024
ADDR = (HOST,PORT)

tcpSerSock = socket(AF_INET, SOCK_STREAM)
tcpSerSock.bind(ADDR)
tcpSerSock.listen(5)
while True:
    print('Waiting for connectin...')
    tcpClisock, addr = tcpSerSock.accept()
    print('...connected from:', addr)
    while True:
        data = tcpClisock.recv(BUFSIZ)
        if not data:
            break
        tcpClisock.send('[%s] %s'.encode('utf-8') %(bytes(ctime(),'utf-8'),data))
    tcpClisock.close()
tcpSerSock.close()
