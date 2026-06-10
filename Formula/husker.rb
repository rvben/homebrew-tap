class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.1/husker-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "51bd11fbb91b899441738b5119e318d56e5a546a9447435b26798a6f6decc7f2"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.1/husker-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "c117d436661720dc9251604a1d0b12effdd5991169ed74c57ddd320dfaed773a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.1/husker-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a013206666052817eedb057f7861f6fe9ac55dbe85a606a2742db1bd6390acb6"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.1/husker-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8260c0432969db2d4f5deea4ddaabfc4e61d8065fadcbf327ca3f7403aac6165"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
