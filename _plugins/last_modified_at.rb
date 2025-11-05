module Jekyll
  module LastModifiedAt
    def last_modified_at(file_path)
      return nil unless file_path
      
      # 构建完整路径
      full_path = if File.exist?(file_path)
        file_path
      else
        File.join(site.source, file_path)
      end
      
      return nil unless File.exist?(full_path)
      
      # 优先尝试从 Git 获取最后修改时间
      git_time = git_last_modified(full_path)
      return git_time if git_time
      
      # 如果 Git 不可用，使用文件系统时间
      File.mtime(full_path)
    end
    
    private
    
    def git_last_modified(full_path)
      # 检查是否在 Git 仓库中
      git_dir = `git rev-parse --git-dir 2>/dev/null`.strip
      return nil if git_dir.empty?
      
      # 获取文件的最后提交时间
      time_str = `git log -1 --format="%ai" -- "#{full_path}" 2>/dev/null`.strip
      return nil if time_str.empty?
      
      # 解析时间字符串
      Time.parse(time_str) rescue nil
    end
  end
  
  # 为 Page 添加 last_modified_at 方法
  class Page
    include LastModifiedAt
    
    def last_modified_at
      @last_modified_at ||= begin
        # 尝试不同的路径属性
        path = self.path || self.relative_path || self.url
        return nil unless path
        
        # 如果是相对路径，需要构建完整路径
        if path.start_with?('/')
          path = path[1..-1]
        end
        
        last_modified_at(path)
      end
    end
  end
  
  # 为 Document (Post) 添加 last_modified_at 方法
  class Document
    include LastModifiedAt
    
    def last_modified_at
      @last_modified_at ||= begin
        # Posts 使用相对路径
        path = self.relative_path || self.path
        return nil unless path
        
        last_modified_at(path)
      end
    end
  end
end
