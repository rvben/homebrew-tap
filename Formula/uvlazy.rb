class Uvlazy < Formula
  desc "Run project-locked Python tools with lazy dependency installation"
  homepage "https://github.com/rvben/uvlazy"
  url "https://static.crates.io/crates/uvlazy/uvlazy-0.1.4.crate"
  version "0.1.4"
  sha256 "a54af3a4394b4e72ce121e44ecaa9eec51c2b379c03a17b9762e802f8bcc1d04"
  license "MIT"

  depends_on "rust" => :build
  depends_on "python@3.14"
  depends_on "uv"

  def install
    system "cargo", "install", *std_cargo_args, "--bin", "uvlazy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uvlazy --version")
    assert_match "usage:", shell_output("#{bin}/uvlazy --help")
    ENV["UV_OFFLINE"] = "1"
    assert_match "pip", shell_output("#{bin}/uvlazy pip --help")
  end
end
