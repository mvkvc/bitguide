import { html } from 'lit';
import { fixture, expect } from '@open-wc/testing';
import { BitguideEmbed } from '../src/BitguideEmbed.js';
import '../src/bitguide-embed.js';

describe('BitguideEmbed', () => {
  it('has a default header "Hey there" and counter 5', async () => {
    const el = await fixture<BitguideEmbed>(html`<bitguide-embed></bitguide-embed>`);

    expect(el.header).to.equal('Hey there');
    expect(el.counter).to.equal(5);
  });

  it('increases the counter on button click', async () => {
    const el = await fixture<BitguideEmbed>(html`<bitguide-embed></bitguide-embed>`);
    el.shadowRoot!.querySelector('button')!.click();

    expect(el.counter).to.equal(6);
  });

  it('can override the header via attribute', async () => {
    const el = await fixture<BitguideEmbed>(html`<bitguide-embed header="attribute header"></bitguide-embed>`);

    expect(el.header).to.equal('attribute header');
  });

  it('passes the a11y audit', async () => {
    const el = await fixture<BitguideEmbed>(html`<bitguide-embed></bitguide-embed>`);

    await expect(el).shadowDom.to.be.accessible();
  });
});
