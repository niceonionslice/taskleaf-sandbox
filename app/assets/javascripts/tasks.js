// window.onload = function() {
document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('td').forEach((td) => {
    td.addEventListener('mouseover', (e) => {
      e.currentTarget.style.backgroundColor = '#eff';
    });

    td.addEventListener('mouseout', (e) => {
      e.currentTarget.style.backgroundColor = '';
    });
  });

  document.querySelectorAll('.delete').forEach((a) => {
    a.addEventListener('ajax:success', () => {
      // // 指定されたノードの DOM ツリー内の親ノードを返します。
      // const td = a.parentNode;
      // // 指定されたノードの DOM ツリー内の親ノードを返します。
      // const tr = td.parentNode;
      // //
      // tr.classList.add("displaynone")
      a.parentNode.parentNode.style.display = 'none';
    });
  });
});

// 最終的にはapplication.jsにまとめることになる。が開発環境ではまだまとめていない。
// Sprocketsがよしなに本番環境と同じ動作になるようにしている。
// document.addEventListener('turbolinks:load', function() {}) と記述することで window.onloadと同じ動作
// をする。 jsを読み込んでから実行する。
