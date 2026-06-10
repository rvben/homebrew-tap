class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.4/husker-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "7073987a4a5a0caecca573d3772e009d3bb4c4161f5c4b57c30c35727f83a88d"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.4/husker-v0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "e3e133d5def302f1c4b44bc88750c61d00a06ab8a9e71141db163aad7496ba17"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.4/husker-v0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33b9c026e3fe8d24ee64a15d16d6c490f478d42fde3338576a36c6c79bcfc80b"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.4/husker-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "714f11cc99ce991d522322d2c6f35c6ba6a37df6729efbcfa9dcb9b113f69883"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
