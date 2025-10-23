// 标签筛选功能
document.addEventListener('DOMContentLoaded', function() {
  const filterButtons = document.querySelectorAll('.k-filter-btn');
  const posts = document.querySelectorAll('.k-row[data-tags]');
  
  filterButtons.forEach(button => {
    button.addEventListener('click', function() {
      const selectedTag = this.getAttribute('data-tag');
      
      // 更新按钮状态
      filterButtons.forEach(btn => btn.classList.remove('active'));
      this.classList.add('active');
      
      // 筛选文章
      posts.forEach(post => {
        const postTags = post.getAttribute('data-tags').split(',');
        
        if (selectedTag === 'all' || postTags.includes(selectedTag)) {
          post.style.display = 'flex';
        } else {
          post.style.display = 'none';
        }
      });
      
      // 平滑滚动到文章列表顶部
      document.getElementById('posts-list').scrollIntoView({ 
        behavior: 'smooth',
        block: 'start'
      });
    });
  });
  
  // 标签点击跳转到筛选
  document.querySelectorAll('.k-tag').forEach(tag => {
    tag.addEventListener('click', function(e) {
      e.preventDefault();
      const tagName = this.textContent.trim();
      const targetButton = document.querySelector(`[data-tag="${tagName}"]`);
      
      if (targetButton) {
        targetButton.click();
      }
    });
  });
});
