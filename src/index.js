import './index.html'
import 'babel-polyfill'
import dva from 'dva'
import createLoading from 'dva-loading'
// import { browserHistory } from 'dva/router';
import { browserHistory } from 'dva/router';

const app = dva({
  ...createLoading({effects: true}),
  history: browserHistory,
  onError (error) {
    console.error('app onError -- ', error)
  },
})

app.model(require('./models/app'))
app.router(require('./router'))
app.start('#app')
