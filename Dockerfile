FROM registry.access.redhat.com/ubi7/ubi

EXPOSE 8080

COPY ./gnu-cobol.jpg /tmp
COPY ./openshift.png /tmp
RUN yum-config-manager --disable '*'
RUN yum-config-manager --enable 'rhel-7-server-rpms'
COPY ./centos7.repo /etc/yum.repos.d
COPY ./libcob-1.1-5.el7.x86_64.rpm /tmp
COPY ./open-cobol-1.1-5.el7.x86_64.rpm /tmp

#Needed for DB4
RUN yum -y localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN yum -y localinstall /tmp/libcob-1.1-5.el7.x86_64.rpm
RUN yum -y localinstall /tmp/open-cobol-1.1-5.el7.x86_64.rpm


RUN yum install -y libtool ncurses ncurses-devel ncurses-libs make && \
    yum install -y libdb-devel libdbi libdbi-devel libtool-ltdl libtool-ltdl-devel db4 db4-devel wget

RUN mkdir /src

COPY ./helloworld.cobol /src

RUN cd /src && cobc -free -x -o helloworld-exe helloworld.cobol

ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH



COPY create_index.sh /tmp/create_index.sh

RUN chmod +x /tmp/create_index.sh

RUN touch /tmp/index.html

RUN chmod 755 /tmp/index.html

CMD cd /tmp && bash create_index.sh && python -m SimpleHTTPServer 8080
