class Verg < Formula
  desc "Stateless infrastructure convergence engine"
  homepage "https://github.com/rvben/verg"
  version "0.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.6.5/verg-v0.6.5-aarch64-apple-darwin.tar.gz"
      sha256 "349caadd746980063f28677d4aa6487cf38328aad8bbb2f323b9212854394b32"
    else
      url "https://github.com/rvben/verg/releases/download/v0.6.5/verg-v0.6.5-x86_64-apple-darwin.tar.gz"
      sha256 "61f6519574356806c3346be96c09c5e71575468ee1d4ba614de5d0e58f0c2493"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.6.5/verg-v0.6.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51f04c9b3129c395be6f892425642d48c1362f2ddb0cbf9d24bb96115e56d9c2"
    else
      url "https://github.com/rvben/verg/releases/download/v0.6.5/verg-v0.6.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d70fd6e4edcab144daa8ff561df3dae54f6be626ba6fda25cb8777610a2fd95b"
    end
  end

  def install
    bin.install "verg"
  end

  test do
    system "#{bin}/verg", "--version"
  end
end
