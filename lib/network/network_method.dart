enum NetworkMethod {
  get('get'),
  post('post'),
  put('put'),
  delete('delete'),
  patch('patch');

  final String value;

  const NetworkMethod(this.value);
}
