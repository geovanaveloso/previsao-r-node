const express = require('express');
const app = express();
const R = require('r-script');

// -------------------------------------------- controllers
function executeExAsync(callback) {
	const meses = 3;
	const faturado = [
		{ Data: '2019-12-01', Valor: 46.73},
		{ Data: '2019-11-01', Valor: 64.61},
		{ Data: '2019-10-01', Valor: 77.25},
		{ Data: '2019-09-01', Valor: 46.73},
		{ Data: '2019-08-01', Valor: 64.61},
		{ Data: '2019-07-01', Valor: 46.73},
		{ Data: '2019-06-01', Valor: 64.61},
		{ Data: '2019-05-01', Valor: 46.73},
		{ Data: '2019-04-01', Valor: 64.61},
		{ Data: '2019-03-01', Valor: 46.73},
		{ Data: '2019-02-01', Valor: 64.61},
		{ Data: '2019-01-01', Valor: 46.73},
		{ Data: '2018-12-01', Valor: 46.73},
		{ Data: '2018-11-01', Valor: 64.61},
		{ Data: '2018-10-01', Valor: 77.25},
		{ Data: '2018-09-01', Valor: 46.73},
		{ Data: '2018-08-01', Valor: 64.61},
		{ Data: '2018-07-01', Valor: 46.73},
		{ Data: '2018-06-01', Valor: 64.61},
		{ Data: '2018-05-01', Valor: 46.73},
		{ Data: '2018-04-01', Valor: 64.61},
		{ Data: '2018-03-01', Valor: 46.73},
		{ Data: '2018-02-01', Valor: 64.61},
		{ Data: '2018-01-01', Valor: 46.73},		
	];

	var result = R('script.R').data({faturado: faturado, meses: meses}).callSync();
	console.error('ex-async success result', result);
	return callback(null, result);
}

// -------------------------------------------- routes

app.get('/', function(req, res) {
	executeExAsync(function(error, result) {
		if (error) {
			return res.status(500).send(error);
		}
		return res.status(200).send(result);
	});
});

// -------------------------------------------- Server Start
const server = app.listen(8082, function() {
	const port = server.address().port;
	console.log(`Example app listening at http://localhost:${port}`);
});
