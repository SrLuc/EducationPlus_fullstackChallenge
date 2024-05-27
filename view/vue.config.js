module.exports = {
    devServer: {
      proxy: {
        '/students': {
          target: 'http://127.0.0.1:9999',
          changeOrigin: true
        }
      }
    }
  };
  