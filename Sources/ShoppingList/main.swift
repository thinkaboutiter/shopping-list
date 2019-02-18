import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import StORM
import MongoDBStORM
import SimpleLogger

// MARK: - Setup DB connection
MongoDBConnection.host = "mongo"
MongoDBConnection.port = 27017
MongoDBConnection.database = "ShoppingList"

// MARK: - Setup server
let server = HTTPServer()
server.serverPort = 8080

// MARK: - Routes
let basic = BasicController()
server.addRoutes(Routes(basic.routes))

// MARK: - Configurations
fileprivate func configure_simpleLogger() {
    let logsDirectoryPath: String = "/var/log/shopping-list/"
    Logger.setLogsDirectoryPath(logsDirectoryPath)
    Logger.update_fileLogging(.multipleFiles)
    Logger.use_delimiter("->")
}

fileprivate func configure_3d_parties() {
    configure_simpleLogger()
}

fileprivate func log_configurations() {
    let message: String = """
    Configurations:
    Server:
    port=\(server.serverPort)
    
    Database:
    host=\(MongoDBConnection.host)
    port=\(MongoDBConnection.port)
    database=\(MongoDBConnection.database)
    """
    Logger.general.message(message)
}

// execute configurations
configure_3d_parties()
log_configurations()

// MARK: - Start server
do {
    try server.start()
}
catch PerfectError.networkError(let err, let msg) {
    Logger.error.message(("Network error thrown: \(err) \(msg)"))
}
