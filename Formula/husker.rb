class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.48/husker-v0.4.48-aarch64-apple-darwin.tar.gz"
      sha256 "5216578e5aeeca79e625b425ecece04b972e8e111040425c52ca5732ba35aa67"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.48/husker-v0.4.48-x86_64-apple-darwin.tar.gz"
      sha256 "29a2b56c2f9a37899cc726d7778df2cf8d710529571b1ee99110c9bb163decf3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.48/husker-v0.4.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9dd00462014b83a304f86be850c1010105e672ab962c31a3543e60d5bc56074f"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.48/husker-v0.4.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c8d6949b4a268c8642568f93cbc4e975ee4775c77d631e440c784a9628d7703"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
