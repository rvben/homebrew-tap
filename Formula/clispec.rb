class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.3/clispec-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "67b52daec7c7d700cfdfc2dae9b9357b27640d8d33963ed3f7cdce3c95b6c912"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.3/clispec-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "121c16ba3ff1dad08f8c9bbe6284960584979a363736b00cc96313ead293291d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.3/clispec-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8794aa1a629de2ae6350d1dfb237dd67f3cae466e81715b57fb05ebae5cbea12"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.3/clispec-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e48febc4c10eca87de4a7f4395e2def5857d8ae4cab6d11a35ec81330c57419"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
