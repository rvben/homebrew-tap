class YoobiCli < Formula
  desc "Read and browse Yoobi timesheets from the command line"
  homepage "https://github.com/rvben/yoobi-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.3/yoobi-cli-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "cbdcd4ff4e92fb3f8fa5ba53eedcb34fafaff4011bad37bb34b8687105c4120c"
    else
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.3/yoobi-cli-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "2150192607921da436f6ec17888be27da4e80e5e5159f111fb30705f7e0bb526"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.3/yoobi-cli-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a03c132e2863a49ecd656477d0f1a2b0b21e2933cbf45590436c117ba01dc51"
    else
      url "https://github.com/rvben/yoobi-cli/releases/download/v0.1.3/yoobi-cli-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e55baf3ee25c188709d5e65e47fb311b89550987a01b2352761e7472b82e05d"
    end
  end

  def install
    bin.install "yoobi-cli"
  end

  test do
    system "#{bin}/yoobi-cli", "--version"
  end
end
