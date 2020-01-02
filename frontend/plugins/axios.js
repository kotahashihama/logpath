export default ({ $axios }) => {
  $axios.onRequest((req) => {
    // undefinedエラーのための記述
    const defaultRequestHeader = JSON.stringify({
      'access-token': '',
      client: '',
      uid: ''
    })
    const requestHeader = JSON.parse(localStorage.requestHeader || defaultRequestHeader)

    // 各リクエストごとにヘッダーを付加する
    req.headers.common['access-token'] = requestHeader['access-token']
    req.headers.common.client = requestHeader.client
    req.headers.common.uid = requestHeader.uid
  })

  $axios.onResponse((res) => {
    // 保存されたリクエストヘッダーがなければ何もしない
    if (localStorage.requestHeader) {
      // レスポンスヘッダーと保存されたリクエストヘッダーを比べ、access-tokenに差異があればアップデート
      const requestHeaderByResponse = {
        'access-token': res.headers['access-token'],
        client: res.headers.client,
        uid: res.headers.uid
      }
      const defaultRequestHeader = JSON.stringify({
        'access-token': '',
        client: '',
        uid: ''
      })
      const requestHeader = JSON.parse(localStorage.requestHeader || defaultRequestHeader)

      if (requestHeaderByResponse['access-token'] !== requestHeader['access-token'] &&
      requestHeaderByResponse['access-token']) {
        requestHeader['access-token'] = requestHeaderByResponse['access-token']
      }

      localStorage.setItem('requestHeader', JSON.stringify(requestHeader))
    }
  })
}
