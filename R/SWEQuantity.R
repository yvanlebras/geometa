#' SWEQuantity
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#' @keywords ISO SWE
#' @return Object of \code{\link{R6Class}} for modelling an SWE Quantity
#' @format \code{\link{R6Class}} object.
#' 
#' @references 
#'   OGC Geography Markup Language. https://www.ogc.org/standards/swecommon
#' 
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
SWEQuantity <- R6Class("SWEQuantity",
  inherit = SWEAbstractSimpleComponent,
  private = list(
    xmlElement = "Quantity",
    xmlNamespacePrefix = "SWE"
  ),
  public = list(
    
    #'@field uom uom
    uom = NULL,
    
    #'@field constraint constraint
    constraint = NULL,
    
    #'@field value value
    value = NA_real_,
    
    #'@description Initializes an object of class \link{SWEQuantity}
    #'@param xml object of class \link{XMLInternalNode-class} from \pkg{XML}
    #'@param uom uom
    #'@param constraint constraint
    #'@param value value
    #'@param updatable updatable
    #'@param optional optional
    #'@param definition definition
    initialize = function(xml = NULL, 
                          uom = NULL, constraint = NULL, value = NULL,
                          updatable = NULL, optional = FALSE, definition = NULL){
      super$initialize(xml, element = private$xmlElement,
                       updatable = updatable, optional = optional, definition = definition)
      if(is.null(xml)){
        self$setUom(uom)
        self$setConstraint(constraint)
        self$setValue(value)
      }
    },
    
    #'@description setUom
    #'@param uom uom
    setUom = function(uom){
      self$uom <- uom
    },
    
    #'@description setConstraint
    #'@param constraint constraint
    setConstraint = function(constraint){
      self$constraint <- constraint
    },
    
    #'@description setValue
    #'@param value value
    setValue = function(value){
      if(!is.numeric(value)){
        stop("Value should be numeric")
      }
      self$value <- value
    }
  )                        
)