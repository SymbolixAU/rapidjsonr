//! Assertion.
/*! \ingroup RAPIDJSON_CONFIG
 By default, rapidjson uses C \c assert() for internal assertions.
 User can override it by defining RAPIDJSON_ASSERT(x) macro.
 */
#ifndef RAPIDJSON_ASSERT
#define RAPIDJSON_ASSERT(x) ((void)0)
#endif // RAPIDJSON_ASSERT

#include "rapidjson/error/en.h"
#include "rapidjson/filereadstream.h"
#include "rapidjson/schema.h"
#include "rapidjson/stringbuffer.h"
#include "rapidjson/prettywriter.h"

#include "rapidjson/document.h"
#include "rapidjson/allocators.h"
using namespace rapidjson;


#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
void testRapidjson(const char* json) {

  Document document;
  document.Parse(json);

  std::string s = document["hello"].GetString();
  Rcpp::Rcout << s << std::endl;

}
