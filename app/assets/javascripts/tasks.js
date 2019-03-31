// window.onload = function() {
document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('td').forEach(function(td){
    td.addEventListener('mouseover', function(e) {
      e.currentTarget.style.backgroundColor = '#eff';
    });

    td.addEventListener('mouseout', function(e){
      e.currentTarget.style.backgroundColor = '';
    });
  });
});

// 最終的にはapplication.jsにまとめることになる。が開発環境ではまだまとめていない。
// Sprocketsがよしなに本番環境と同じ動作になるようにしている。
// document.addEventListener('turbolinks:load', function() {}) と記述することで window.onloadと同じ動作
// をする。 jsを読み込んでから実行する。
