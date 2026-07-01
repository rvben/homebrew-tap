class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.32/husker-v0.4.32-aarch64-apple-darwin.tar.gz"
      sha256 "a3733a4610c9f45f61e665c9d50ede66843e3f627b489719ab9e392db3586e58"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.32/husker-v0.4.32-x86_64-apple-darwin.tar.gz"
      sha256 "c199cbe6b9db537a1be1565259adb5caf1c39a7a2302f1ca2570bb72203820d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.32/husker-v0.4.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3717b9840813eb12c10092daaec3f5e37a91d2abf02a90119cc7ee2f447ed2be"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.32/husker-v0.4.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a59a87260a9959b6d52583ea24dfe1c1ca2149adf049282c50b7c37099cb8fe"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
