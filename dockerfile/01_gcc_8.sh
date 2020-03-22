cd /root && \
curl --output gcc.tar.gz http://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-8.4.0/gcc-8.4.0.tar.gz && \
tar xzf gcc.tar.gz && \
cd gcc-8.4.0 && \
./contrib/download_prerequisites && \
mkdir build && \
cd build && \
../configure --disable-multilib --enable-languages=c,c++,fortran,go && \
make -j $(nproc) && \
make install && \
cd /root && \
git clone git://sourceware.org/git/binutils-gdb.git && \
cd binutils-gdb && \
git checkout fe26d3a34a223a86fddb59ed70a621a13940a088 && \
mkdir build && \
cd build && \
../configure --prefix=/usr --enable-gold --enable-ld=default --enable-plugins --enable-shared --disable-werror --enable-64-bit-bfd --with-system-zlib && \
make -j "$(nproc)" && \
LD_LIBRARY_PATH=/usr/lib make install && \
cd /root && \
rm -rf gcc-8.4.0
