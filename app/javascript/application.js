// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import "./add_jquery"
import "./jquery-ui"

$(document).on('ready turbo:load', function() {
	initSortableTables();
});

function initSortableTables() {
	$('.table-sortable').sortable({
		axis: 'y',
		handle: '.table-sortable-handle',
		update: updateSortableTableDatabase
	});
	$('.table-sortable-handle').css('cursor', 'move');
}

async function updateSortableTableDatabase(event, ui) {
	sortable_table = $(this);
	const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");
	data = sortable_table.sortable('serialize');
	const requestURL = `/update/sortable_table?${data}`;
	const response = await fetch(requestURL, {
		method: "PUT",
		headers: {
			"X-CSRF-Token": csrf
		}
	});
	const fetch_success = await response.ok;
	console.log(fetch_success);
	if (!fetch_success) {
		sortable_table.sortable('cancel');
	}
}