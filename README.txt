使用方法
1) 把本包文件放到仓库根目录（会新建/覆盖以下文件）：
   - _data/ui.yml             # 自定义文案
   - _includes/subscribe.html # 覆盖主题，去掉 RSS 提示
   - assets/main.scss         # 高级灰主题 + 全站样式
   - index.html               # 自定义首页（卡片列表、搜索、标签）
   - _layouts/post.html       # 文章页“发布于/更新于”

2) _config.yml 建议：
   theme: minima
   timezone: Asia/Tokyo
   excerpt_separator: "<!--more-->"

3) 修改文案：编辑 _data/ui.yml，例如更换“表头/下标”文字（如“发布于/更新于”）。

4) 提交到 main，等待 GitHub Pages 构建完成。
