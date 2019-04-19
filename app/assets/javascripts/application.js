// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// セキュリティーの観点から別タブで開くときには全てこれを設定する。
document.addEventListener('turbolinks:load', () => {
  const aElementList = document.querySelectorAll('a')
  aElementList.forEach((element) => {
    console.log("呼ばれたーよー")

    // a タグにtarget属性が存在しなかったらreturn
    if (element.hasAttribute('target') === false) {
      // console.log("なかったー")
      return;
    }

    // target属性_blankではなかったらreturn
    if (element.getAttribute('target') !== '_blank') {
      // console.log("あったけど、ちがったー")
      return;
    }

    // rel属性にnoopenerを付与する
    element.setAttribute('rel', 'noopener');
    console.log('あったーったー')
  });

  // オフライン時にオフラインをお知らせするロジック
  isOffline();
});

const isOffline = () => {
  const isOnline = navigator.onLine;
  const offlineElementList = document.querySelector('.offline')
  if(isOnline === true) {
    offlineElementList.style.display = 'none';
  } else {
    offlineElementList.style.display = 'block';
  }
  return;
}
