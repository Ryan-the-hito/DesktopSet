import { css } from "uebersicht"
const yaml = require('./lib/js-yaml.js')

const quote_block = css`
  background: rgba(0, 0, 0, 0);
  padding: 10px 20px;
  border-radius:20px;
  height: 895px;
  border:4px dashed white
`

const quote__text = css`
  font-size: 24px;
  font-weight: 300;
  font-smoothing: antialiased;
  padding-bottom: 3%;
`

const quote__author = css`
  text-align: right;
  font-size: 18px;
`

export const className = `
  left: 1070px;
  top: 20px;
  width: 590px;
  white-space: pre-line;
  color: #fff;
  font-family: Helvetica Neue;
`

export const refreshFrequency = 60000;

export const initialState = { output: `` };

//export const command = "cat /Users/wolf/D/Notes/notebook/Quotes.yaml";

export const render = ({ output, error }) => {
  try {
    console.log(output);
    var doc = yaml.safeLoad(output);
    var max = doc.length;
    var quoteN = Math.floor(Math.random() * max ) + 0;
    var quote = doc[quoteN];
    console.log(quote.q);
  } catch (e) {
    console.log(e);
  }
  return (
    <div className={quote_block}>
    </div>
  );
}