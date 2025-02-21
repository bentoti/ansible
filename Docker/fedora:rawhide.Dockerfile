FROM fedora:rawhide
LABEL CODENAME="Rawhide"
RUN dnf install --assumeyes ansible git tree vim

WORKDIR /root/source/ansible
COPY . ./
RUN ./mythtv.yml --limit=localhost

WORKDIR /root/source
RUN git clone https://github.com/MythTV/mythtv.git

WORKDIR /root/source/mythtv
RUN git checkout fixes/35 \
    && cmake --preset qt5 \
    && cmake --build build-qt5
