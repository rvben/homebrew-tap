class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.14/jira-cli-v0.3.14-aarch64-apple-darwin.tar.gz"
      sha256 "4d0cacd42b3f8dc51d56efebc672d99a66622dbce9a740179e68b5b484072932"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.14/jira-cli-v0.3.14-x86_64-apple-darwin.tar.gz"
      sha256 "16d7272f026a140fd4419ea19f29bda182e81cf0896384b5d08d546c32059ed7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.14/jira-cli-v0.3.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd06e7d12b4279fbf0fe7e907a75d5859cc58b2a412963590ad395d8bc863351"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.14/jira-cli-v0.3.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "714db964284cb19fd1f78b0398072fda814e12ff073444325100fca6c782ef42"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
