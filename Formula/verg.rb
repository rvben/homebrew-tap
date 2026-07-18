class Verg < Formula
  desc "Stateless infrastructure convergence engine"
  homepage "https://github.com/rvben/verg"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.8.0/verg-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "aac463bd14fcc165580b8f9e250043666c7703ef1c018000bbc15380d25d22d2"
    else
      url "https://github.com/rvben/verg/releases/download/v0.8.0/verg-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "04dba9538f45bb901a543980e1cfb2362e0355e78d31dff8df60dfc4d565ee25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/verg/releases/download/v0.8.0/verg-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e85144414cb3bbd08bac5bf6bfaaf6455a4125488cffd539673ceea91b36b03"
    else
      url "https://github.com/rvben/verg/releases/download/v0.8.0/verg-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f211a1686e238231c0a3b64aa86750b0aca70c19b231de6f32b060c666c548a5"
    end
  end

  def install
    bin.install "verg"
  end

  test do
    system "#{bin}/verg", "--version"
  end
end
