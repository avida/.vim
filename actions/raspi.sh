function setup_raspi {
   setup_base
   echo "Installing python packages"
   pip3 install $PIP_RASPI
   echo "Installin application from linux repository"
   sudo bash -c "$PACKAGE_MGR $PI_PACKAGE_LIST"
   echo "Installing pynrf24 lib"
   git clone https://github.com/jpbarraca/pynrf24.git pynrf24
   pushd pynrf24
   python3 setup.py install
   popd
   rm -rf pynrf24
}
