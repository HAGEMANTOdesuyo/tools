#!/bin/sh
#
# jq --version
# jq-1.6
#
# 実行例
# ./apitest.sh ./input_sample

# ブラウザ
browser='C:\ProgramData\Microsoft\Windows\Start Menu\Programs'
# 引数チェック
if [ $# != 1 ]; then
    echo 'syntax error!!'
    echo 'correct syntax:./test_api <inputfile path>'
    exit 1
fi

# input読み込み
. $1
cmdfile=$(basename $1)
cmdfile=${cmdfile//input/curlcmd}
echo $cmdfile
url=${api}
echo '#!/bin/sh' > ${cmdfile}
echo curl \\ >>${cmdfile}

# ヘッダー
if [ "${cookie}" != "" ]; then
    header='-H '\'${cookie}\'
    echo ${header} \\ >> ${cmdfile}
fi

# POST
if [ "${post}" != "" ]; then
    #echo post param is exist.
    option='-X POST -d '
    option=${option}\'${post}\'
    echo ${option} \\ >> ${cmdfile}
fi

# PUT
if [ "${put}" != "" ]; then
    option='-X PUT -d '
    option=${option}\'${put}\'
    echo ${option} \\ >> ${cmdfile}
fi

# GET
if [ "${urlparam}" != "" ]; then
    url=${url}${urlparam}
fi
echo \'${url}\' >> ${cmdfile}

# curl実行
chmod +x ./${cmdfile}
./${cmdfile}
#./${cmdfile} | jq .

# エラーが発生した場合、リダイレクトしてその内容をブラウザで表示する
if [ $? != 0 ]; then
    ./${cmdfile} > error.html
    $browser error.html
fi
