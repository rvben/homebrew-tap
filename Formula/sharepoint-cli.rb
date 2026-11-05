class SharepointCli < Formula
  desc "Manage SharePoint sites, libraries, and files"
  homepage "https://github.com/rvben/sharepoint-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.1.0/sharepoint-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7a37d8be99e7b6fb159151abbbcf50660f6ee7f2db7cc9432459ec09d4d8d8f1"
    else
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.1.0/sharepoint-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "199e757535cf4104349c73047574b5220fa2fb245ae5740dd5fc6df59ddd878b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.1.0/sharepoint-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7abf583aeb13332ccd27d60b627b714f336149600c6d30bfa41e484236efce71"
    else
      url "https://github.com/rvben/sharepoint-cli/releases/download/v0.1.0/sharepoint-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b6bd3ed1b98075d33b8eedf513b73b58cdab3a82483757dce212a5716792272"
    end
  end

  def install
    bin.install "sharepoint"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sharepoint --version")
    assert_match "Usage:", shell_output("#{bin}/sharepoint --help")
  end
end
