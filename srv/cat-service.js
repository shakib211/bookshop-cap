module.exports = (srv) => {
	srv.on("CancelOrder", async (req) => {
		console.log("req", req.data);

		return {
			name: null,
			ID: null,
		};
	});
};
