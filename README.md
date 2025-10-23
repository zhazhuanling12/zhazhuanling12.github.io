# 示例包：按 `_posts` 目录划分 + 自动更新时间
步骤：
1) 把本项目所有文件复制到你的 `username.github.io` 仓库。
2) 在 Settings → Pages → Build and deployment → Source 选择 GitHub Actions。
3) 推送到 main 分支；Actions 会使用 `jekyll-last-modified-at` 构建并部署到 Pages。

要点：
- 左侧目录来自 `_posts` 子目录的完整路径（`categories | join: "/"`）。
- 首页与文章页的“更新于”读取 `last_modified_at`（来自 Git 最后提交时间）。
- 你可以在 `_data/ui.yml` 自定义文案；`assets/main.scss` 改配色/字号。
