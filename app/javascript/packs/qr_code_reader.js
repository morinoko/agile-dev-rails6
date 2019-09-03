import { BrowserQRCodeReader } from '@zxing/library';

const codeReader = new BrowserQRCodeReader();

codeReader
  .decodeFromInputVideoDevice(undefined, 'video')
  .then((result) => {
    console.log(result.text)
    document.getElementById('result').textContent = result.text
  })
  .catch(err => console.error(err));

