class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.23/jira-cli-v0.4.23-aarch64-apple-darwin.tar.gz"
      sha256 "fc7c1c2164b95e7a7b24e463c920b22b50b923c0c256b43545ac7038b27af352"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.23/jira-cli-v0.4.23-x86_64-apple-darwin.tar.gz"
      sha256 "2e24c8afe2f5c8085e8f3c9c918636e609443584dfb9a34e0265a1fe388c2248"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.23/jira-cli-v0.4.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f3ec51db844e4131528840d935001d0e455919d665a699bad7397bbf8a4808b"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.23/jira-cli-v0.4.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "591a62e98937096f348ff997701c7727d26184f21ecd773c7225e68583dd4c2f"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
