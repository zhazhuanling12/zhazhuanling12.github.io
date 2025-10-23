# Karpathy 风格极简博客（含评论）

## 功能
- 顶部导航：左侧可选 RSS 图标，中间站点名，右侧导航（默认 About）。
- 首页列表：左列日期、右列标题 + 摘要，排版接近截图风格。
- 文章页：同样的极简排版。
- 评论：支持 **Disqus** 或 **Giscus**（任选其一，通过 `_data/ui.yml` 切换）。
- 纯静态，GitHub Pages 兼容；RSS 可选（启用 `jekyll-feed` 插件即可）。

## 快速使用
1. 把所有文件放到你的 `username.github.io` 仓库根目录并提交。
2. 如果需要 RSS，将 `_config.yml` 中的 `plugins` 解注释并保持 `_data/ui.yml` 里的 `show_rss: true`。
3. 配置评论：编辑 `_data/ui.yml` → `comments`：
   - **Disqus**：把 `provider` 设为 `disqus`，填 `shortname`（如 `your-shortname`）。
   - **Giscus**：把 `provider` 设为 `giscus`，并填 `repo`、`repo_id`、`category`、`category_id` 等字段（在 https://giscus.app 获取）。
4. 提交后访问首页与任意文章页，底部会出现评论区。

## 写作
- 新文章放进 `_posts/`，命名 `YYYY-MM-DD-title.md`。摘要分隔符可在正文放 `<!--more-->`。
