function previewImages() {
    const previewContainer = document.getElementById('image-preview');
    previewContainer.innerHTML = ""; // 画像プレビューをクリア

    const files = document.getElementById('image-upload').files;
    console.log(files); // 画像ファイルが存在するか確認
    if(files.length > 0) {
        Array.from(files).forEach(file => {
            const reader = new FileReader();
            reader.onload = function(event) {
                const imgElement = document.createElement('img');
                imgElement.src = event.target.result;
                imgElement.classList.add('image-preview-list');
                imgElement.style.maxWidth = "100px"; // サムネイルサイズ
                imgElement.style.margin = '10px'; // 少しスペースを追加

                previewContainer.appendChild(imgElement);
            };
            reader.readAsDataURL(file); // 画像ファイルを読み込んで表示
        });
    }
}

window.previewImages = previewImages; // グローバルに関数を公開