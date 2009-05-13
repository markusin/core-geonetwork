//=============================================================================
//===	Copyright (C) 2001-2007 Food and Agriculture Organization of the
//===	United Nations (FAO-UN), United Nations World Food Programme (WFP)
//===	and United Nations Environment Programme (UNEP)
//===
//===	This program is free software; you can redistribute it and/or modify
//===	it under the terms of the GNU General Public License as published by
//===	the Free Software Foundation; either version 2 of the License, or (at
//===	your option) any later version.
//===
//===	This program is distributed in the hope that it will be useful, but
//===	WITHOUT ANY WARRANTY; without even the implied warranty of
//===	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
//===	General Public License for more details.
//===
//===	You should have received a copy of the GNU General Public License
//===	along with this program; if not, write to the Free Software
//===	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
//===
//===	Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
//===	Rome - Italy. email: geonetwork@osgeo.org
//==============================================================================

package org.fao.geonet.services.util;

import java.io.IOException;
import java.io.StringReader;
import java.util.Iterator;
import jeeves.constants.Jeeves;
import jeeves.server.UserSession;
import jeeves.server.context.ServiceContext;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.Token;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.fao.geonet.constants.Geonet;
import org.jdom.Element;

/**
 * 
 * Get default params info from session and/or request
 * and process text parameters.
 * 
 * @author fxprunayre
 *
 */
public class MainUtil {
	/**
	 * Default params for search
	 * Usually, default variable for search parameters
	 * could be set up in xml/search/lucene.xsl (e.g. template parameter
	 * default value is "n").
	 * 
	 * TODO : All DEFAULT_PARAMS should be set by lucene.xsl file to have
	 * all default values in the same place.
	 */
	private static String[][] DEFAULT_PARAMS = {
			{ Geonet.SearchResult.RELATION,
					Geonet.SearchResult.Relation.OVERLAPS },
			{ Geonet.SearchResult.EXTENDED, Geonet.Text.OFF },
			{ Geonet.SearchResult.REMOTE, Geonet.Text.OFF },
			{ Geonet.SearchResult.TIMEOUT, "20" },
			{ Geonet.SearchResult.HITS_PER_PAGE, "10" },
			{ Geonet.SearchResult.SIMILARITY, ".8" },
			{ Geonet.SearchResult.OUTPUT, Geonet.SearchResult.Output.FULL },
			{ Geonet.SearchResult.SORT_BY, Geonet.SearchResult.SortBy.RELEVANCE },
			{ Geonet.SearchResult.SORT_ORDER, "" },
			{ Geonet.SearchResult.INTERMAP, Geonet.Text.ON } };

	/**
	 * Returns default values for the search parameters. If request params are
	 * set, they're used. If parameters have changed in the user session, they
	 * are read out here.
	 * 
	 * @param srvContext
	 * @param request
	 * @return
	 */
	public static Element getDefaultSearch(ServiceContext srvContext,
			Element request) {
		UserSession session = srvContext.getUserSession();
		Element elData = new Element(Jeeves.Elem.REQUEST);
		Element elSession = (Element) session
				.getProperty(Geonet.Session.MAIN_SEARCH);

		// If request use request info else default info
		if (request != null) {
			for (String[] p : DEFAULT_PARAMS) {
				String pr = request.getChildText(p[0]);
				if (pr != null)
					elData.addContent(new Element(p[0]).setText(pr));
				else
					elData.addContent(new Element(p[0]).setText(p[1]));

				// Remove child for append the non default one later
				request.removeChild(p[0]);
			}

			// Add other elements send by the request
			// It could be extra parameters handle by Lucene in lucene.xsl
			// and not set by default
			Iterator<Element> otherEl = request.getChildren().iterator();
			while (otherEl.hasNext()) {
				Element e = otherEl.next();
				elData
						.addContent(new Element(e.getName()).setText(e
								.getText()));
			}

		} else if (elSession != null) {
			// If no request and session exist use session info
			elData = elSession;
		} else {
			// else use default values
			for (String[] p : DEFAULT_PARAMS)
				elData.addContent(new Element(p[0]).setText(p[1]));
		}

		// Set params in session for future use
		session.setProperty(Geonet.Session.MAIN_SEARCH, elData);
		return elData;
	}

	/**
	 * Splits a text in tokens.
	 * 
	 * @param requestStr
	 * @return
	 */
	public static String splitWord(String requestStr) {
		Analyzer a = new StandardAnalyzer();
		// Analyzer a = new CJKAnalyzer();

		StringReader sr = new StringReader(requestStr);
		TokenStream ts = a.tokenStream(null, sr);

		String result = new String("");

		try {
			Token t = ts.next();

			while (t != null) {
				// CHECKME : result += (" " + t.termText());
				result += (" " + new String(t.termBuffer()));
				t = ts.next();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
}
