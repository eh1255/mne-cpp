#!/bin/bash
#set -ev

if [[ "${TRAVIS_PULL_REQUEST}" == "false" ]]; then

    # === Copy Libs ===
	QT_LIB_DIR=/opt/qt56/bin
    QT_LIBS=(libQt5Core libQt5Concurrent libQt5Gui libQt5Svg libQt5Widgets libQt5Xml)
    n_elements=${#QT_LIBS[@]}
    for ((i = 0; i < n_elements; i++)); do
        libpath="$QT_LIB_DIR/${QT_LIBS[i]}.*"
        cp $libpath ./lib
    done

    # === user package ===
    archive_name="mne-cpp-linux-x86_64-$TRAVIS_BRANCH.tar.gz"
    tar cfvz $archive_name ./bin ./lib

    #Master
    if [[ $TRAVIS_BRANCH == 'master' ]]; then
        # upload artifacts
        curl -u $MASTER_LOGIN:$MASTER_PASSWORD -T $archive_name ftp://$REMOTE_SERVER/
    elif [[ $TRAVIS_BRANCH == '1.0.0' ]]; then
        # upload artifacts
        curl -u $ONEOO_LOGIN:$ONEOO_PASSWORD -T $archive_name ftp://$REMOTE_SERVER/
    fi
fi