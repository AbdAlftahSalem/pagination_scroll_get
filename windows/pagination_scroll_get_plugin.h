#ifndef FLUTTER_PLUGIN_PAGINATION_SCROLL_GET_PLUGIN_H_
#define FLUTTER_PLUGIN_PAGINATION_SCROLL_GET_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace pagination_scroll_get {

class PaginationScrollGetPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PaginationScrollGetPlugin();

  virtual ~PaginationScrollGetPlugin();

  // Disallow copy and assign.
  PaginationScrollGetPlugin(const PaginationScrollGetPlugin&) = delete;
  PaginationScrollGetPlugin& operator=(const PaginationScrollGetPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace pagination_scroll_get

#endif  // FLUTTER_PLUGIN_PAGINATION_SCROLL_GET_PLUGIN_H_
