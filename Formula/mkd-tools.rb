class MkdTools < Formula
  desc "Read, search, and export Monokakido dictionaries"
  homepage "https://github.com/kiwakiwaa/mkd-tools"
  url "https://github.com/kiwakiwaa/mkd-tools.git",
      tag:      "v0.9.0",
      revision: "ec2025e3a7fedbb9d0af4afc930e9118669c55be"
  license "GPL-3.0-only"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  uses_from_macos "zlib"

  on_linux do
    depends_on "openssl@3"
  end

  def install
    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja",
                    "-DMKD_BUILD_CLI=ON",
                    "-DMKD_BUILD_PYTHON=OFF",
                    "-DBUILD_TESTING=OFF",
                    *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"dictionaries").mkpath
    assert_equal "No dictionaries found.",
                 shell_output("#{bin}/mkd-tools --dir #{testpath}/dictionaries list").strip
  end
end
